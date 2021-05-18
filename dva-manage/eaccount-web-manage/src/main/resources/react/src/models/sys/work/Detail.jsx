import ModelUtils from '../../../utils/ModelUtils.jsx'
import {post} from '../../../utils/Request.jsx';

const {routerRedux} = dva.router;

export const namespace = 'sysWorkDetail';
export const baseUrl = 'sys/work/detail';
const {message} = antd;
const model = ModelUtils(baseUrl, namespace);

export default {
    ...model,
    state: {
        ...model.state,
        order: {},
        isModalVisible: false,
        dealTypes: [
            {
                value: '回复',
                label: '回复'
            },
            {
                value: '完成',
                label: '完成'
            },
            {
                value: '评价',
                label: '评价'
            }
        ],
        dealType: '回复',
        dealAnswer: ''
    },
    reducers: {
        ...model.reducers,
        refreshData(state, {order}) {
            return {...state, order: order};
        },
        modalCancel(state) {
            return {...state, isModalVisible: false, dealType: '回复', dealAnswer: ''};
        },
        showOrderModal(state) {
            return {...state, isModalVisible: true};
        },
        selectChange(state, {value}) {
            return {...state, isModalVisible: true, dealType: value};
        },
        answerChange(state, {value}) {
            return {...state, isModalVisible: true, dealAnswer: value};
        }
    },
    effects: {
        ...model.effects,
        * toDetails({aid}, {put, call}) {
            const {data} = yield call(post, `${baseUrl}/getDetails`, {aid: aid});
            yield put({type: 'refreshData', order: data});
            yield put(routerRedux.push({pathname: `/${baseUrl}`}))
        },
        * modalOk({values}, {put, call}) {
            let {msg} = yield call(post, `${baseUrl}/updateOrderProcess`, values);
            if (msg === 'success') {
                message.success(msg);
                yield put({type: 'modalCancel'});
                yield put({type: 'toDetails', aid: values.aid});
            } else {
                message.error(msg);
            }
        }
    }

};