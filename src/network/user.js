import { request } from './request';

// 请求user数据
export function getUserData() {
    return request({
        url: '/user.php'
    })
}

// 添加
export function getAddUser(addparams) {
    return request({
        method: 'post',
        url: '/add_user.php',
        data: addparams
    })
}

// 更改
export function getUseUser(upparams) {
    return request({
        method: 'post',
        url: '/use_user.php',
        data: upparams
    })
}

// 删除
export function getDelUser(id) {
    return request({
        method: 'get',
        url: '/del_user.php',
        params: {
            id
        }
    })
}

// 分页
export function getPageUser(sortType, page) {
    return request({
        method: 'get',
        url: '/user.php',
        params: {
            sortType,
            page
        }
    })
}

// 排序
export function getSortUser(sortType, page) {
    return request({
        method: 'get',
        url: '/user.php',
        params: {
            sortType,
            page
        }
    })
}

// 搜索
export function getSearchUser(parameter) {
    return request({
        method: 'get',
        url: '/user.php',
        params: {
            parameter
        }
    })
}