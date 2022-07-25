import { request } from './request';

export function getTicketData() {
    return request({
        url: '/ticket.php'
    })
}

// 新增
export function getAddTicket(addticket) {
    return request({
        method: 'post',
        url: '/add_ticket.php',
        data: addticket
    })
}

// 更改
export function getSetTicket(setticket) {
    return request({
        method: 'post',
        url: '/use_ticket.php',
        data: setticket
    })
}

// 删除
export function getDelTicket(ticket_id) {
    return request({
        method: 'get',
        url: '/del_ticket.php',
        params: {
            ticket_id
        }
    })
}

// 分页
export function getPageTicket(sortType, page) {
    return request({
        method: 'get',
        url: '/ticket.php',
        params: {
            sortType,
            page
        }
    })
}


// 排序
export function getSortTicket(sortType, page) {
    return request({
        method: 'get',
        url: '/ticket.php',
        params: {
            sortType,
            page
        }
    })
}

// 搜索
export function getSearchTicket(parameter) {
    return request({
        method: 'get',
        url: '/ticket.php',
        params: {
            parameter
        }
    })
}