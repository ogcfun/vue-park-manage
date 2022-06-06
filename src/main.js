import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './assets/less/index.less'


// import axios from 'axios';
// Vue.prototype.$axios = axios
import qs from 'qs';
Vue.prototype.$qs = qs;


import {
    Button,
    Radio,
    Container,
    Main,
    Header,
    Aside,
    Menu,
    Submenu,
    MenuItem,
    MenuItemGroup,
    Dropdown,
    DropdownMenu,
    DropdownItem,
    Row,
    Col,
    Card,
    Table,
    TableColumn,
    Breadcrumb,
    BreadcrumbItem,
    Tag,
    Form,
    FormItem,
    Input,
    Select,
    Option,
    Switch,
    DatePicker,
    Dialog,
    Pagination,
    MessageBox,
    Message,
    Autocomplete,
    ButtonGroup,
} from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(Button).use(Radio).use(Container).use(Main).use(Header).use(Aside)
    .use(Menu).use(Submenu).use(MenuItem).use(MenuItemGroup).use(Dropdown)
    .use(DropdownMenu).use(DropdownItem).use(Row).use(Col).use(Card)
    .use(Table).use(TableColumn).use(Breadcrumb).use(BreadcrumbItem)
    .use(Tag).use(Form).use(FormItem).use(Input).use(Select).use(Option)
    .use(Switch).use(DatePicker).use(Dialog).use(Pagination).use(Autocomplete)
    .use(ButtonGroup);
Vue.prototype.$confirm = MessageBox.confirm
Vue.prototype.$message = Message

import VueAnimateNumber from 'vue-animate-number'
Vue.use(VueAnimateNumber)


Vue.config.productionTip = false

// router.beforeEach((to, from, next) => {
//     store.commit('getToken')
//     const token = store.state.user.token
//     if (!token && to.name !== 'login') {
//         next({ name: 'login' })
//     } else if (token && to.name === 'login') {
//         next({ name: 'home' })
//     } else {
//         next()
//     }
// })


new Vue({
    router,
    store,
    render: h => h(App),
    created() {
        store.commit('addMenu', router)
    }
}).$mount('#app')