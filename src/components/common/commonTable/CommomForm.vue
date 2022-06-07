<template>
  <el-form :model="form" :rules="rules" ref="form">
    <el-form-item label="用户名称" prop="user_name">
      <el-input v-model="form.user_name" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="用户账号" prop="user_account">
      <el-input v-model="form.user_account" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="用户密码" prop="user_password">
      <el-input v-model="form.user_password" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="form.email" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="地址" prop="addr">
      <el-input v-model="form.addr" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="账户权限">
      <el-input v-model="form.permissions" auto-complete="off"></el-input>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  name: "CommomForm",
  props: {
    form: Object,
  },
  data() {
    return {
      rules: {
        user_name: [
            { required: true, message: "请输入用户名称,由中文组成" },
            { min: 2, max: 18, message: '用户名称长度在 2 到 18 个字符,由中文组成', trigger: 'blur' }
        ],
        user_account:[
            { required: true, message: "请输入用户账号,由数字、26个英文字母或者下划线组成" },
            { min: 6, max: 12, message: '用户账号长度在 6 到 12 个字符,由数字、26个英文字母或者下划线组成', trigger: 'blur' }
        ],
        user_password:[
            { required: true, message: "请输入用户密码,由数字、26个英文字母或者下划线组成" },
            { min: 6, max: 18, message: '用户密码长度在 6 到 18 个字符,由数字、26个英文字母或者下划线组成', trigger: 'blur' }
        ],
        addr:[
            { required: true, message: "请输入地址,由中文组成" },
            { min: 6, max: 24, message: '地址长度在 6 到 24 个字符,由中文组成', trigger: 'blur' }
        ],
        email:[{ type: 'email', message: '请输入正确的邮箱地址', trigger: 'change' }],
  
      }
    };
  },
};
</script>

<style lang="less">
</style>