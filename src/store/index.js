import Vue from 'vue'
import Vuex from 'vuex'
import tab from './tab';
import user from './user';

Vue.use(Vuex)

export default new Vuex.Store({
    state: {},
    mutations: {},
    actions: {},
    modules: {
        tab,
        user
    }
})