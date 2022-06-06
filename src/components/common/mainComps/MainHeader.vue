<template>
    <header>
        <div class="l-content">
            <el-button @click="handleMenu" plain icon="el-icon-menu" size="mini"></el-button> 
            <!-- <h3 style="color: #fff">首页</h3> -->
            <el-breadcrumb separator-class="el-icon-arrow-right">
                <el-breadcrumb-item 
                v-for="item in tags" 
                :key="item.path" 
                :to="{ path: item.path }"
                >
                {{item.label}}
                </el-breadcrumb-item>
            </el-breadcrumb>
        </div>

        <div class="r-content">
            <el-dropdown trigger="click" size="mini">
                <span>
                    <img class="user" :src="userImg" alt="">
                </span>
                <el-dropdown-menu slot="dropdown">
                    <router-link to="/setting">
                        <el-dropdown-item>个人设置</el-dropdown-item>
                    </router-link>
                    <el-dropdown-item @click.native="logOut">退出登录</el-dropdown-item>
                </el-dropdown-menu>   
            </el-dropdown>
        </div>
    </header>
</template>

<script>
import { mapState } from 'vuex'

export default {
    name: 'CommonHeader',
    data() {
        return {
            userImg: require('../../../assets/image/user.jpg')
        }
    },
    methods: {
        handleMenu() {
            this.$store.commit('collapseMenu')
        },
    },
    computed: {
        ...mapState({
            tags: state => state.tab.tabsList
        })
    }
}
</script>

<style lang="less" scoped>
    header {
        display: flex;
        height: 100%;
        justify-content: space-between;
        align-items: center;
    }
    .l-content {
        display: flex;
        align-items: center;
        .el-button {
            margin-right: 20px;
        }
    }
    .r-content {
        .iconfont {
            margin-right: 14px;
            cursor: pointer;
        }
        .user {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }
    }
</style>