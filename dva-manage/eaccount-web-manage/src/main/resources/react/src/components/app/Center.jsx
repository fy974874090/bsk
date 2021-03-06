const { connect } = dva;
const { Row, Col } = antd;
import { namespace } from '../../models/App.jsx'

function Center (props) {
    return (
        <div className="error-page">
            <Row type="flex" justify="space-around" align="middle" style={{ height: 'calc(100vh - 90px)' }}>
                <Col span={12}>
                    <p className="text-center error-state">Index</p>
                    <p className="text-center error-text">你正在使用智能家居售后服务管理平台</p>
                </Col>
            </Row>
        </div>
    );
}

export default connect(state => state[namespace])(Center);