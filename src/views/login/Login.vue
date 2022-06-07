<template>
  <el-form
    :model="form"
    status-icon
    :rules="rules"
    ref="form"
    label-width="100px"
    class="login-container"
  >
    <h3 class="login_title">公园售票系统登录</h3>
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
  </el-form>
</template>

<script>
import { getUserForm } from "network/login";
export default {
  name: "Login",
  data() {
    return {
      form: {
        username: "",
        password: "",
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
        const userform = this.form;
        let tokenuserform = this.$qs.stringify({ userform });
        getUserForm(tokenuserform).then((res) => {
          // console.log(res);
          if (res.code == 666) {
            this.$message({
              message: res.msg,
              type: "success",
            });
            this.$store.commit("clearMenu");
            this.$store.commit("setMenu", res.menu);
            this.$store.commit("setToken", res.token);
            this.$store.commit("addMenu", this.$router);
            this.$router.push({ name: "home" });
          } else if (res.code == -6) {
            this.$message({
              message: res.msg,
              type: "danger",
            });
          }
        });
      });
      // getUserForm(this.form).then(res => {
      //     console.log(res);
      //     if(res.code === 20000) {
      //         this.$store.commit('clearMenu')
      //         this.$store.commit('setMenu',res.data.menu)
      //         this.$store.commit('setToken',res.data.token)
      //         this.$store.commit('addMenu',this.$router)
      //         this.$router.push({name: 'home'})
      // this.$router.push('/home')
      //     }else {
      //         this.$message.warning(res.data.message)
      //     }
      // })
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
  background-color: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}

.login_title {
  margin: 0 auto 40px auto;
  text-align: center;
  color: #505458;
}

.login_submit {
  margin: 10px auto 0 auto;
}
</style>