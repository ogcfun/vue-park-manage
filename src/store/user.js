import Cookie from 'js-cookie';

export default {
    state: {
        token: '',
        userimage: '',
        permissions: '',
        userName: ''
    },
    mutations: {
        setToken(state, val) {
            state.token = val
            Cookie.set('token', val)
        },
        clearToken(state) {
            state.token = ''
            Cookie.remove('token')
        },
        getToken(state) {
            state.token = state.token || Cookie.get('token')
        },
        setPermissions(state, permissions) {
            state.permissions = permissions
            Cookie.set('permissions', permissions)
        },
        setUserimage(state, userimage) {
            state.userimage = userimage
            Cookie.set('userimage', userimage)
        },
        setUsernamed(state, usernamed) {
            state.userName = usernamed
            Cookie.set('usernamed', usernamed)
        },
    }
}