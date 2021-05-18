const {connect} = dva;
const {Form, Form: {Item}, Input, Input: {TextArea}, Button, Select } = antd;
const {CrudForm} = require('../../Widgets.jsx');
const Constants = require("../../Constants.jsx");
import {namespace} from '../../../models/sys/Work.jsx'

class sysWorkForm extends CrudForm {
    static defaultProps = {
        namespace
    };

    render() {
        const {form: {getFieldDecorator}, edit: {record}, loading, dispatch} = this.props, {
            item: {
                layout,
                tailLayout
            }
        } = Constants.FORM;
        return (
            <div style={{padding: '40px 20px'}}>
                <Form onSubmit={this.handleSubmit.bind(this)}>
                    <Item {...layout} colon={false}
                          label={<span className="form-title">数据{record ? '修改' : '录入'}</span>}/>
                    <Item {...layout} label='标题' hasFeedback>
                        {getFieldDecorator('title', {
                            rules: [
                                {required: true, message: '请输入标题!'}
                            ]
                        })(<Input/>)}
                    </Item>
                    <Item {...layout} label='产品' hasFeedback>
                        {getFieldDecorator('product', {
                            rules: [
                                {required: true, message: '请选择你要申请售后的产品'}
                            ]
                        })(
                            <Select style={{ width: 120 }}>
                                <Option value="智能水壶">智能水壶</Option>
                                <Option value="智能洗衣机">智能洗衣机</Option>
                            </Select>
                        )}
                    </Item> 
                    <Item {...layout} label='描述' hasFeedback>
                        {getFieldDecorator('content', {
                            rules: [
                                {required: false, message: '请简单描述需要处理的问题!'}
                            ]
                        })(<TextArea style={{resize: "vertical"}}/>)}
                    </Item>
                    <Item {...tailLayout}>
                        <Button type="primary" htmlType="submit" disabled={loading} size="large">提交</Button>
                        <Button size="large" style={{marginLeft: 8}}
                                onClick={() => dispatch({type: `${namespace}/closeFormPage`})}>返回</Button>
                    </Item>
                </Form>
            </div>
        );
    }
}

module.exports = connect(state => {
    return {...state[namespace], loading: state.loading.effects[`${namespace}/save`]}
})(Form.create()(sysWorkForm));