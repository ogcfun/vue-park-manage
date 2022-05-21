import Cookie from 'js-cookie';

export default {
    state: {
        isCollapse: false,
        tabsList: [{
            path: '/',
            name: 'home',
            label: '首页',
            icon: 'home'
        }],
        currentMenu: null,
        menu: [{
                path: '/',
                name: 'home',
                label: '首页',
                icon: 's-home',
                url: 'home/Home'
            },
            {
                path: '/user',
                name: 'user',
                label: '用户管理',
                icon: 'user-solid',
                url: 'user/User'
            },
            {
                path: '/sellTickets',
                name: 'sellTickets',
                label: '售票管理',
                icon: 's-order',
                url: 'tickets/SellTickets'
            },
            {
                path: '/ticketClass',
                name: 'ticketClass',
                label: '票务管理',
                icon: 's-ticket',
                url: 'ticketClass/TicketClass'
            },
            {
                path: '/search',
                name: 'search',
                label: '查询',
                icon: 's-promotion',
                url: 'search/Search'
            },
            {
                path: '/stats',
                name: 'stats',
                label: '统计',
                icon: 's-data',
                url: 'stats/Stats'
            },
            {
                label: '设置',
                icon: 's-operation',
                children: [{
                        path: '/setting',
                        name: 'setting',
                        label: '个人设置',
                        icon: 'setting',
                        url: 'set/Setting'
                    },
                    {
                        path: '/userSet',
                        name: 'userSet',
                        label: '用户设置',
                        icon: 'setting',
                        url: 'set/UserSet'
                    }
                ]
            },
        ]
    },
    mutations: {
        collapseMenu(state) {
            state.isCollapse = !state.isCollapse
        },
        selectMenu(state, val) {
            if (val.name !== 'home') {
                state.currentMenu = val
                const result = state.tabsList.findIndex(item => item.name === val.name)
                if (result === -1) {
                    state.tabsList.push(val)
                }
            } else {
                state.currentMenu = null
            }
        },
        closeTag(state, val) {
            const result = state.tabsList.findIndex(item => item.name === val.name)
            state.tabsList.splice(result, 1)
        },
        setMenu(state, val) {
            state.menu = val
            Cookie.set('menu', JSON.stringify(val))
        },
        clearMenu(state) {
            state.menu = []
            Cookie.remove('menu')
        },
        addMenu(state, router) {
            if (!Cookie.get('menu')) {
                return
            }
            const menu = JSON.parse(Cookie.get('menu'))
            state.menu = menu
            const menuArray = []
            menu.forEach(item => {
                if (item.children) {
                    item.children = item.children.map(item => {
                        item.component = () =>
                            import (`../views/${item.url}`)
                        return item
                    })
                    menuArray.push(...item.children)
                } else {
                    item.component = () =>
                        import (`../views/${item.url}`)
                    menuArray.push(item)
                }
            });
            // 路由的动态添加
            menuArray.forEach(item => {
                router.addRoute('Main', item)
            })
        }
    }
}