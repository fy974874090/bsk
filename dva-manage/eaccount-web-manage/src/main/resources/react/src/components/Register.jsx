const {connect} = dva;
const {Link} = dva.router;
const {Layout, Form, Icon, Input, Button} = antd;
const {Content} = Layout;
const {Item} = Form;
const {Password} = require("./Widgets.jsx");
import {namespace} from '../models/sys/User.jsx';
import {rsaEncrypt} from '../utils/StringUtils.jsx';

function Register(props) {
    const {username, password, form: {getFieldDecorator, validateFields}, loading, dispatch} = props;//父子组件传递
    return (
        <Layout className="login">
            <Content>
                <div className="logo">
                    <img src="resources/image/logo.png" alt=""/>
                </div>
                <div className="content">
                    <h3>用户注册</h3>
                    <Form onSubmit={undefined}
                          className="login-form">
                        <Item>
                           { /**在获取或设置该控件的值
                             */}
                            {getFieldDecorator('username', {
                                rules: [{required: true, message: '请输入你的用户名!'}],
                            })(
                                <Input size="large" prefix={<Icon type="user" style={{fontSize: 18}}/>}
                                       placeholder="请输入用户名"
                                       value={username}
                                       onChange={(e) => dispatch({//回调
                                           type: `${namespace}/changeUserName`,
                                           username: e.target.value // 需要传递的信息
                                       })}
                                />
                            )}
                        </Item>
                        <Item>
                            {getFieldDecorator('password', {
                                rules: [{required: true, message: '请输入你的密码!'}],
                            })(
                                <Password
                                    prefix={<Icon type="lock" style={{fontSize: 18}}/>}
                                    value={password}
                                    size="large" fontSize={18} placeholder="请输入密码"
                                    onChange={(e) => dispatch({
                                        type: `${namespace}/changePassword`,
                                        password: e.target.value
                                    })}
                                />
                            )}
                        </Item>
                        <Item>
                            <Button type="primary" className="login-form-button" loading={loading}
                                    onClick={() => {
                                        dispatch({
                                            type: `${namespace}/register`,
                                            user: {username: username, password: rsaEncrypt(password)}
                                        })
                                    }}
                            >
                                注册
                            </Button>
                        </Item>
                        <Link to='/login'>已有账号?去登录</Link>
                    </Form>
                </div>
            </Content>
        </Layout>
    );
}
//建立连接
module.exports = connect(state => {
    return {
        ...state[namespace],
        loading: state.loading.effects[`${namespace}/register`]
    };
})(Form.create()(Register));