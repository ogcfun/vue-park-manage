<template>
  <body
    v-loading="loading"
    element-loading-text="登陆中"
    element-loading-spinner="el-icon-loading"
    element-loading-background="rgba(0, 0, 0, 0.8)"
  >
    <vue-particles
      class="login-bj"
      color="#11E6FC"
      :particleOpacity="0.8"
      :particlesNumber="60"
      shapeType="circle"
      :particleSize="6"
      linesColor="#72EAF6"
      :linesWidth="1"
      :lineLinked="true"
      :lineOpacity="0.4"
      :linesDistance="150"
      :moveSpeed="3"
      :hoverEffect="true"
      hoverMode="grab"
      :clickEffect="true"
      clickMode="push"
    >
    </vue-particles>
    <el-form
      :model="form"
      status-icon
      :rules="rules"
      ref="form"
      label-width="100px"
      class="login-container"
    >
      <h3 class="login_title">某公园售票系统登录</h3>
      <el-form-item
        label="用户名"
        label-width="80px"
        prop="username"
        class="username"
      >
        <el-input
          type="input"
          v-model="form.username"
          autocomplete="off"
          placeholder="请输入账号"
        ></el-input>
      </el-form-item>
      <el-form-item label="密码" label-width="80px" prop="password">
        <el-input
          type="password"
          v-model="form.password"
          autocomplete="off"
          placeholder="请输入密码"
        ></el-input>
      </el-form-item>
      <el-form-item class="login_submit">
        <el-button type="primary" @click="login(form)" class="login_snbmit"
          >登录</el-button
        >
      </el-form-item>
      <div class="signUp">
        <span>还没有账号？<a @click="signUp">申请成为管理员</a></span>
      </div>
    </el-form>
  </body>
</template>

<script>
import { getUserForm } from "network/login";
export default {
  name: "Login",
  data() {
    return {
      loading: false,
      form: {
        //登录
        username: "admind",
        password: "123456",
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            message: "用户名长度不能小于3位",
            trigger: "blur",
          },
        ],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
      },
    };
  },
  methods: {
    login() {
      this.$refs.form.validate(async (valid) => {
        if (!valid) return;
        this.loading = true;
        const userform = this.form;
        let tokenuserform = this.$qs.stringify({ userform });
        setTimeout(() => {
          getUserForm(tokenuserform).then((res) => {
            // console.log(res);
            if (res.code === 666) {
              this.loading = false;
              this.$message({
                message: res.msg,
                type: "success",
              });
              this.$store.commit("setPermissions", res.permissions);
              this.$store.commit("setUserimage", res.userimage);
              this.$store.commit("setUsernamed", res.usernamed);
              this.$store.commit("clearMenu");
              this.$store.commit("setMenu", res.menu);
              this.$store.commit("setToken", res.token);
              this.$store.commit("addMenu", this.$router);
              this.$router.push({ name: "home" });
            } else if (res.code == -6) {
              this.loading = false;
              this.$message({
                message: res.msg,
                type: "danger",
              });
            }
          });
        }, 1000);
      });
    },

    signUp() {
      this.$router.push({ name: "signUp" });
    },
  },
};
</script>

<style lang="less" scoped>
body {
  height: 100vh;
  padding: 0;
  margin: 0;
  position: relative;
  background-color: rgb(0, 0, 0);
  .login-bj {
    height: 100vh;
    background-image: url("../../assets/image/bj.webp");
    background-size: 100%;
  }
}
.login-container {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  border-radius: 15px;
  background-clip: padding-box;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background-color: rgba(0, 0, 0, 0.3);
  box-shadow: 0 0 25px #000000;
}

.login_title {
  margin: 0 auto 40px auto;
  text-align: center;
  color: #dddddd;
}

.login_submit {
  margin: 10px auto 20px auto;
}

.signUp {
  text-align: center;
  span {
    color: rgb(146, 146, 146);
    font-size: 10px;
    font-weight: 100;
    a {
      color: rgb(26, 157, 245, 0.5);
      font-size: 12px;
      cursor: pointer;
      font-weight: normal;
    }
  }
}
</style>