<template>
    <el-card shadow="hover">
        <div class="user">
          <img v-if="this.$store.state.user.userimage ||userimage" :src="require(`@/api/${this.$store.state.user.userimage ||userimage}`)" alt="" />
          <div class="userinfo">
            <p class="name">{{userName}}</p>
            <p class="access"><el-tag>{{permissions}}</el-tag></p>
          </div>
        </div>
        <div class="login-info">
          <p>
            上次登录时间:<span>{{ dateFormat(new Date()) }}</span>
          </p>
          <p>上次登录地点:<span>南宁</span></p>
        </div>
      </el-card>
</template>

<script>
import Cookie from 'js-cookie';
export default {
    name: 'UserCard',
    data() {
        return {
            userimage:  Cookie.get('userimage'),
            userName: this.$store.state.user.userName || Cookie.get('usernamed'),
            permissions: this.$store.state.user.permissions || Cookie.get('permissions'),
        }
    },
    methods: {
    dateFormat() {
      var date = new Date();
      var year = date.getFullYear();

      var month =
        date.getMonth() + 1 < 10
          ? "0" + (date.getMonth() + 1)
          : date.getMonth() + 1;
      var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
      // 拼接 时间格式处理
      return year + "年" + month + "月" + day + "日 ";
    },
  },
}
</script>

<style lang="less" scoped>
    
</style>