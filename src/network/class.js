import { request } from './request';

export function getClassTicketData() {
    return request({
        url: '/class_ticket.php'
    })
}

// 新增
export function getAddClass(addclass) {
    return request({
        method: 'post',
        url: '/add_class.php',
        data: addclass
    })
}

// 更改
export function getSetClass(setclass) {
    return request({
        method: 'post',
        url: '/use_class.php',
        data: setclass
    })
}

// 删除
export function getDelClass(id) {
    return request({
        method: 'get',
        url: '/del_class.php',
        params: {
            id
        }
    })
}