import { request } from './request';

export function getUserForm(userfrom) {
    return request({
        method: 'post',
        url: '/login.php',
        data: userfrom
    })
}