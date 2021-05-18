const {message} = antd;
import ModelUtils from '../../utils/ModelUtils.jsx';
import {post} from '../../utils/Request.jsx';

const {routerRedux} = dva.router;

export const namespace = 'user';
export const baseUrl = 'sys/user';

const model = ModelUtils(baseUrl, namespace);

export default {
    ...model,
    state: {
        ...model.state,
        username: '',
        password: ''
    },
    reducers: {
        ...model.reducers,
        changeUserName(state, {username}) {
            return {...state, username: username};
        },
        changePassword(state, {password}) {
            return {...state, password: password};
        }
    },
    effects: {
        ...model.effects,
        * shotOff({payload: {record: {account: {account}}}}, {call, put}) {
            const formData = new FormData();
            formData.append("username", account);
            const {msg} = yield call(post, `${baseUrl}/shotOff`, formData);
            yield call(message.success, msg);
            yield put({type: 'reload'});
        },
        * register({user}, {call, put}) {
            let result = yield call(post, `${baseUrl}/register`, user);
            if (result.success) {
                yield put({type: `changeUserName`, username: ''});
                yield put({type: `changePassword`, password: ''});
                message.success("账号注册成功!已为您自动跳转到登陆页面", 5);
                yield put(routerRedux.push({pathname: '/login'}));
            } else {
                message.error(result.msg);
            }
        }
    }
};