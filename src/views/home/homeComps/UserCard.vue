<template>
    <el-card shadow="hover">
        <div class="user">
          <img :src="userImg" alt="" />
          <div class="userinfo">
            <p class="name">YLN-D</p>
            <p class="access">超级管理员</p>
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
export default {
    name: 'UserCard',
    data() {
        return {
            userImg: require("assets/image/user.jpg"),
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