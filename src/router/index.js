import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [{
        path: '/',
        name: 'Main',
        component: () =>
            import ('../views/Main.vue'),
        redirect: 'home',
        children: [{
            path: '/home',
            name: 'home',
            component: () =>
                import ('../views/home/Home.vue')
        }, {
            path: '/user',
            name: 'user',
            component: () =>
                import ('../views/user/User.vue')
        }, {
            path: '/ticketClass',
            name: 'ticketClass',
            component: () =>
                import ('../views/ticketClass/TicketClass.vue')
        }, {
            path: '/sellTickets',
            name: 'sellTickets',
            component: () =>
                import ('../views/ticket/SellTickets.vue')
        }, {
            path: '/search',
            name: 'search',
            component: () =>
                import ('../views/search/Search.vue')
        }, {
            path: '/stats',
            name: 'stats',
            component: () =>
                import ('../views/stats/Stats.vue')
        }, {
            path: '/setting',
            name: 'setting',
            component: () =>
                import ('../views/set/Setting.vue')
        }, {
            path: '/userSet',
            name: 'userSet',
            component: () =>
                import ('../views/set/UserSet.vue')
        }]
    },
    {
        path: '/login',
        name: 'login',
        component: () =>
            import ('../views/login/Login.vue')
    }
]

const router = new VueRouter({
    routes,
    mode: 'hash'
})

export default router