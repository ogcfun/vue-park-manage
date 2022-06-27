import { request } from './request';


export function getSignData() {
    return request({
        url: '/sign_list.php'
    })
}


// 注册
export function getAddSign(addsign) {
    return request({
        method: 'post',
        url: '/addsign.php',
        data: addsign
    })
}

// 拒绝
export function getDelSign(sign_id) {
    return request({
        method: 'get',
        url: '/del_sign.php',
        params: {
            sign_id
        }
    })
}


// 通过
export function getAgreeSign(sign_id) {
    return request({
        method: 'get',
        url: '/agree_sign.php',
        params: {
            sign_id
        }
    })
}

// 分页
export function getPageSign(page) {
    return request({
        method: 'get',
        url: '/sign_list.php',
        params: {
            page
        }
    })
}