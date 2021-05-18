const { message } = antd;
const { routerRedux } = dva.router;
import {del, post} from './Request.jsx';

export default function (baseUrl, namespace) {
    return {
        namespace,
        state: {
            searchData: {},
            pagination: {
                total: 0,
                page: 1,
                size: 10
            },
            dataSource: [],
            edit: {}
        },
        //同步行为会直接通过 Reducers 改变 State
        reducers: {
            reInit(state, { payload }) {
                return { ...payload };
            },
            saveRet(state, { payload: { pagination, rows: dataSource, searchData } }) {
                return { ...state, pagination, dataSource, searchData };
            },
            setEditData(state, { payload }) {
                return { ...state, edit: { ...payload } };
            },
            clearEditData(state) {
                return { ...state, edit: {} };
            },
            onExpandedRowsChange(state, { payload: { expandedRowKeys } }) {// 记录树table展开的key
                return { ...state, expandedRowKeys };
            }
        },
        //异步行为先触发 Effects 然后流向 Reducers 最终改变 State
        effects: {
            *fetch({ payload: { pagination: { page, size = 10 }, searchData } }, { call, put }) {
                const {
                    data: {
                        rows,
                        pagination
                    }
                } = yield call(post, `${baseUrl}/list?page=${page}&size=${size}`, searchData);
                // const _rows = rows.map((row, index) => {
                //     row.key = index;
                //     return row
                // })
                yield put({type: 'saveRet', payload: {rows: rows, pagination, searchData}});
            },
            *reload(action, { put, select }) {
                const { pagination, searchData } = yield select(state => state[namespace]);
                yield put({ type: 'fetch', payload: { pagination, searchData } });
            },
            *paginationLoad({ payload: { pagination } }, { put, select }) {
                pagination.page = pagination.current;
                const { searchData } = yield select(state => state[namespace]);
                yield put({ type: 'fetch', payload: { pagination, searchData } });
            },
            *openFormPage({ payload }, { put }) {
                yield put({ type: 'setEditData', payload });
                yield put(routerRedux.push({ pathname: `/${baseUrl}/form` }));
            },
            *closeFormPage(action, { put }) {
                yield put(routerRedux.push({ pathname: `/${baseUrl}`}));
            },
            *openEditPage({ payload: { editData, url } }, { put }) {
                yield put({ type: 'setEditData', payload: { ...editData } });
                yield put(routerRedux.push({ pathname: `/${baseUrl}/${url}` }));
            },
            *save({ payload: { values, url } }, { call, put }) {
                const { msg } = yield call(post, `${baseUrl}/${url}`, values);
                yield call(message.success, msg);
                yield put({ type: 'clearEditData' });// 清空编辑信息
                yield put(routerRedux.push({ pathname: `/${baseUrl}` }));
            },
            *del({ payload: { record: { key } } }, { call, put }) {
                const { msg } = yield call(del, `${baseUrl}/delete/${key}`);
                yield call(message.success, msg);
                yield put({ type: 'reload' });
            },
            *postKey({ payload: { record: { key }, uri } }, { call, put }) {
                const { msg } = yield call(post, `${baseUrl}/${uri}/${key}`);
                yield call(message.success, msg);
                yield put({ type: 'reload' });
            }
        },
        subscriptions: {
            setup({ dispatch, history }) {
                return history.listen(({ pathname, query }) => {
                    listenReload(dispatch, baseUrl, pathname)
                });
            }
        }
    };
}

export function listenReload(dispatch, baseUrl, pathname) {
    if (checkUrl(baseUrl, pathname)) {
        dispatch({ type: 'reload' });
    }
}

export function checkUrl(pathname, url) {
    return pathname === url || pathname === `${url}/`;
}