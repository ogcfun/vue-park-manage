<template>
  <el-form :model="form">
    <el-form-item label="用户名称">
      <el-input v-model="form.user_name" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="用户密码">
      <el-input v-model="form.user_password" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="用户权限">
      <el-input disabled v-model="form.user_permissions" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="备注">
      <el-input v-model="form.memo" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="账号状态">
      <el-input disabled v-model="form.state" auto-complete="off"></el-input>
    </el-form-item>
    <el-form-item label="地址">
      <el-input v-model="form.addr" auto-complete="off"></el-input>
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
    return {};
  },
};
</script>

<style lang="less">
</style>