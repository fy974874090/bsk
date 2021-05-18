export default function hasPermission(sn) {
    return window.sys.sns && window.sys.sns.has(sn);
}