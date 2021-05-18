const {connect} = dva;//从dva中导入connect
const {Input, Table, Modal, Select, Row, Col} = antd;
const {Option} = Select;
const {TextArea} = Input;
const {Plink} = require('../../Widgets.jsx');
const {ToolbarGroup} = Plink;
const Constants = require('../../Constants.jsx');
import {namespace} from '../../../models/sys/Work.jsx'
import {namespace as detailNamespace} from '../../../models/sys/work/Detail.jsx'
import moment from 'moment';
import hasPermission from '../../../utils/PermissionUtil.jsx';

const formType = `${namespace}/openFormPage`;

function sysWork(props) {
    const {
        aid,
        workers,
        chooseId,
        chooseWorker,
        contactInfo,
        isModalVisible,
        isConfirmModalVisible,
        dataSource,
        pagination,
        loading,
        dispatch
    } = props;
    const _datasouce = dataSource.map(record => {
        record.key = record.aid;
        return record;
    });
    return (
        <div style={{padding: 20}}>
            <div className='search-result-list'>
                {hasPermission('sys_work_order_add') ? <ToolbarGroup>
                    <Plink type='primary' sn='sys_work_order_add' onClick={() => dispatch({type: formType})}>新增</Plink>
                </ToolbarGroup> : undefined}
                <Table
                    className="ant-table-wrapper-tag"
                    dataSource={_datasouce}
                    pagination={pagination}
                    loading={loading}
                    onChange={(pagination) => {
                        dispatch({type: `${namespace}/paginationLoad`, payload: {pagination}})
                    }}
                    bordered
                    columns={[
                        {
                            title: '单号',
                            dataIndex: 'aid'
                        },
                        {
                            title: '消费者账户',
                            dataIndex: 'consumer'
                        },
                        {
                            title: '负责员工',
                            dataIndex: 'worker'
                        },
                        {
                            title: '标题',
                            dataIndex: 'title'
                        },
                        {
                            title: '产品',
                            dataIndex: 'product'
                        },
                        {
                            title: '申请状态',
                            dataIndex: 'state',
                            render: text => {
                                if (text === '0' || text === 0) {
                                    return '待分配';
                                } else if (text === '1' || text === 1) {
                                    return '正在处理';
                                } else if (text === '2' || text === 2) {
                                    return '已结束';
                                }
                                return '--';
                            }
                        },
                        {
                            title: '更新时间',
                            dataIndex: 'updateTime',
                            render: text => {
                                return moment(text).format("YYYY-MM-DD HH:mm:ss")
                            }
                        },
                        {
                            title: '创建时间',
                            dataIndex: 'createTime',
                            render: text => {
                                return moment(text).format("YYYY-MM-DD HH:mm:ss")
                            }
                        },
                        Plink.getTableColumnAction([
                            {
                                label: '编辑',
                                sn: 'sys_work_order_modify',
                                onClick: (text, record) => dispatch({type: formType, payload: {record}})
                            },
                            {
                                label: '确认',
                                sn: 'sys_work_order_confirm',
                                onClick: (record) => dispatch({type: `${namespace}/showConfirmModal`, aid: record.aid})
                            },
                            {
                                label: '明细',
                                sn: 'sys_work_order_detail',
                                onClick: record => dispatch({type: `${detailNamespace}/toDetails`, aid: record.aid})
                            },
                            {
                                label: '分配',
                                sn: 'sys_work_order_distribution',
                                onClick: (record) => {
                                    dispatch({type: `${namespace}/showModal`, aid: record.aid});
                                }
                            },
                            {
                                label: '删除',
                                sn: 'sys_work_order_delete',
                                confirmText: Constants.DELETE_TEXT,
                                onConfirm: (text, record) => dispatch({type: `${namespace}/del`, payload: {record}})
                            }])
                    ]}
                />
                <Modal
                    title='分配员工'
                    visible={isModalVisible}
                    onOk={() => dispatch({type: `${namespace}/modalOk`, values: {aid: aid, worker: chooseWorker}})}
                    onCancel={() => dispatch({type: `${namespace}/modalCancel`})}
                >
                    <Row gutter={8}>
                        <Col span={2}>
                            <span>单号:</span>
                        </Col>
                        <Col>
                            <Input style={{width: '90%'}} name='aid' bordered={false} disabled value={aid}/>
                        </Col>
                    </Row>
                    <Row gutter={8}>
                        <Col span={2}>
                            <span>员工:</span>
                        </Col>
                        <Col>
                            <Select
                                style={{width: '90%'}}
                                defaultValue={chooseWorker}
                                onChange={(e) => {
                                    dispatch({type: `${namespace}/selectChange`, value: e})
                                }}
                            >
                                {workers.map(worker => {
                                    return <Option key={worker.key} value={worker.value}>{worker.label}</Option>
                                })}
                            </Select>
                        </Col>
                    </Row>
                </Modal>
                <Modal
                    title='工单确认'
                    visible={isConfirmModalVisible}
                    onOk={() => dispatch({
                        type: `${namespace}/orderConfirm`,
                        values: {
                            aid: chooseId,
                            dealType: '已确认',
                            dealAnswer: '已经确认工单,稍微会与您联系,若长时间未与您联系,烦请主动联系,联系方式为：' + contactInfo
                        }
                    })}
                    onCancel={() => dispatch({type: `${namespace}/orderConfirmCancel`})}
                >
                    <Row gutter={8}>
                        <Col span={4}>
                            <span>联系方式:</span>
                        </Col>
                        <Col>
                            <TextArea style={{resize: "vertical"}} value={contactInfo}
                                      onChange={(e) => dispatch({
                                          type: `${namespace}/contactInfoChange`,
                                          value: e.target.value
                                      })}
                                      name='contactInfo'/>
                        </Col>
                    </Row>
                </Modal>
            </div>
        </div>
    );
}

module.exports = connect(state => {
    const effects = state.loading.effects;
    return {
        ...state[namespace],
        loading: effects[`${namespace}/fetch`] || effects[`${namespace}/del`]
    }
})(sysWork);