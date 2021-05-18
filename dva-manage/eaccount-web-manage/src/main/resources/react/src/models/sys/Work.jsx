import ModelUtils from '../../utils/ModelUtils.jsx'
import {post} from '../../utils/Request.jsx';
import {baseUrl as detailBaseUrl} from '../../models/sys/work/Detail.jsx';

const {message} = antd;

export const namespace = 'sysWork';
export const baseUrl = 'sys/work';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model,
    state: {
        ...model.state,
        isModalVisible: false,
        aid: '',
        workers: [],
        chooseId: '',
        chooseWorker: '',
        isConfirmModalVisible: false,
        contactInfo: ''
    },
    reducers: {//同步操作，唯一可以修改  state 的地方
        ...model.reducers,
        showModalAction(state, {data: {aid, workers}}) {
            console.log(aid);
            console.log(workers);
            return {...state, isModalVisible: true, aid: aid, workers: workers};
        },
        modalCancel(state) {
            return {...state, isModalVisible: false, aid: '', workers: [], chooseWorker: ''};
        },
        selectChange(state, {value}) {
            console.log(value);
            return {...state, chooseWorker: value}
        },
        showConfirmModal(state, {aid}) {
            return {...state, isConfirmModalVisible: true, chooseId: aid};
        },
        orderConfirmCancel(state) {
            return {...state, isConfirmModalVisible: false, contactInfo: ''};
        },
        contactInfoChange(state, {value}) {
            return {...state, contactInfo: value};
        }
    },
    effects: {//异步调用 获取从服务端获取数据，并且发起一个 action 交给 reducer 的地方
        ...model.effects,
        * showModal({aid}, {put, call}) {
            const {data} = yield call(post, `${baseUrl}/workers`);
            yield put({type: 'showModalAction', data: {aid: aid, workers: [...data]}});
        },
        * modalOk({values}, {put, call}) {
            let {msg} = yield call(post, `${baseUrl}/distribute`, values);
            if (msg === 'success') {
                message.success(msg);
                yield put({type: 'modalCancel'});
                yield put({type: 'reload'});
            } else {
                message.error(msg);
            }
        },
        * orderConfirm({values}, {put, call}) {
            let {msg} = yield call(post, `${detailBaseUrl}/updateOrderProcess`, values);
            if (msg === 'success') {
                message.success(msg);
                yield put({type: 'orderConfirmCancel'});
                yield put({type: 'reload'});
            } else {
                message.error(msg);
            }
        }
    }
};