import { request } from './request';

// 请求user数据
export function getUserData() {
    return request({
        url: '/user.php'
    })
}