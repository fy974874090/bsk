const {connect} = dva;
const {Card, Modal, Select, Select: {Option}, Row, Col, Button, Input: {TextArea}} = antd;
import {namespace} from '../../../../models/sys/work/Detail.jsx';
import moment from 'moment';

function sysWorkDetail(props) {
    const {dealTypes, dealType, dealAnswer, order, dispatch} = props;
    const {details} = order;
    return (
        <div style={{padding: 20}}>
            <Card title='工单明细' noHovering style={{height: '100%'}}
                  extra={
                      <div>
                          <Button type='primary'
                                  onClick={() => dispatch({type: `${namespace}/showOrderModal`})}>更新进度</Button>
                      </div>
                  }
            >
                <div className='baseContent'>
                    <h2 className='orderTitle'>{order.title}</h2>
                    <p className='orderContent'>{order.content}</p>
                </div>
                <div>
                    {
                        details.map((detail, index) => {
                            return (
                                <section className='code-box-meta markdown'>
                                    <div className='code-box-title'>
                                        {console.log(detail.dealType.label)}
                                        <p>{'#' + (index + 1) + '  ' + detail.operator + '  ' + moment(detail.createTime).format("YYYY-MM-DD HH:mm:ss")+'  '+detail.dealType}</p>
                                    </div>
                                    <div>
                                        <p>{detail.dealAnswer}</p>
                                    </div>
                                </section>
                            );
                        })
                    }
                </div>
            </Card>
            <Modal
                title='更新进度'
                visible={props.isModalVisible}
                onOk={() => dispatch({
                    type: `${namespace}/modalOk`,
                    values: {aid: order.aid, dealType: dealType, dealAnswer: dealAnswer}
                })}
                onCancel={() => dispatch({type: `${namespace}/modalCancel`})}
            >
                <Row gutter={8}>
                    <Col span={2}>
                        <span>状态:</span>
                    </Col>
                    <Col>
                        <Select
                            style={{width: '90%'}}
                            defaultValue={dealType}
                            onChange={(e) => {
                                dispatch({type: `${namespace}/selectChange`, value: e})
                            }}
                        >
                            {dealTypes.map((dealType, index) => {
                                return <Option key={index} value={dealType.value}>{dealType.label}</Option>
                            })}
                        </Select>
                    </Col>
                </Row>
                <Row gutter={8}>
                    <Col span={2}>
                        <span>描述:</span>
                    </Col>
                    <Col>
                        <TextArea style={{resize: "vertical"}} value={dealAnswer}
                                  onChange={(e) => dispatch({type: `${namespace}/answerChange`, value: e.target.value})}
                                  name='dealAnswer'/>
                    </Col>
                </Row>
            </Modal>
        </div>
    );
}

module.exports = connect(state => {
    const effects = state.loading.effects;
    return {
        ...state[namespace],
        loading: effects[`${namespace}/fetch`] || effects[`${namespace}/del`]
    }
})(sysWorkDetail);