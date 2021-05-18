const { connect } = dva;
const { Form, Form: { Item }, Input, Button } = antd;
const { CrudForm } = require('../../../Widgets.jsx');
const Constants = require("../../../Constants.jsx");
import { namespace } from '../../../../models/sys/work/Detail.jsx'

class sysWorkDetailForm extends CrudForm {
    static defaultProps = {
        namespace
    };
    render() {
        const { form: { getFieldDecorator }, edit: { record }, loading, dispatch } = this.props, { item: { layout, tailLayout }} = Constants.FORM;
        return (
            <div style={{padding: '40px 20px'}}>
                <Form onSubmit={this.handleSubmit.bind(this)}>
                    <Item {...layout} colon={false}
                        label={<span className="form-title">数据{record ? '修改' : '录入'}</span>} />
                    <Item {...layout} label='消费者账户ID' hasFeedback>
                        {getFieldDecorator('operator', {
                            rules: [
                                { required: true, message: '请输入消费者账户ID!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='自增主键' hasFeedback>
                        {getFieldDecorator('orderId', {
                            rules: [
                                { required: true, message: '请输入自增主键!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='数据状态，A正常D删除S停用T其他' hasFeedback>
                        {getFieldDecorator('status', {
                            rules: [
                                { required: true, message: '请输入数据状态，A正常D删除S停用T其他!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='自增主键' hasFeedback>
                        {getFieldDecorator('aid', {
                            rules: [
                                { required: true, message: '请输入自增主键!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='处理进度明细' hasFeedback>
                        {getFieldDecorator('dealAnswer', {
                            rules: [
                                { required: true, message: '请输入处理进度明细!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='创建时间' hasFeedback>
                        {getFieldDecorator('createTime', {
                            rules: [
                                { required: true, message: '请输入创建时间!' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...layout} label='处理进度类型，U更新 A回复 C完成 ' hasFeedback>
                        {getFieldDecorator('dealType', {
                            rules: [
                                { required: true, message: '请输入处理进度类型，U更新 A回复 C完成 !' }
                            ]
                        })(<Input />)}
                    </Item>
                    <Item {...tailLayout}>
                        <Button type="primary" htmlType="submit" disabled={loading} size="large">提交</Button>
                        <Button size="large" style={{ marginLeft: 8 }} onClick={ () => dispatch({ type: `${namespace}/closeFormPage`})}>返回</Button>
                    </Item>
                </Form>
            </div>
        );
    }
}

module.exports = connect(state => {
return { ...state[namespace], loading: state.loading.effects[`${namespace}/save`] }
})(Form.create()(sysWorkDetailForm));