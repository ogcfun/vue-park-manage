import { request } from './request';

export function getUserRecord(record) {
    return request({
        method: 'post',
        url: '/record.php',
        data: record
    })
}

export function getUserRecordList() {
    return request({
        url: '/recordlist.php',
    })
}