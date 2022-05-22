import { request } from './request';

// 请求home数据
export function getUserData() {
    return request({
        url: '/user.php'
    })
}