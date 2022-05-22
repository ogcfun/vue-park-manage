<template>
  <div class="manage-header">
    <el-button type="primary">+ 新增用户</el-button>
    <div>
      <el-autocomplete
        class="inline-input"
        v-model="disease"
        placeholder="请输入用户id/名称"
        :trigger-on-focus="false"
      ></el-autocomplete>
      <el-button type="primary">搜索</el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserAddSearch",
  data() {
    return {
      disease: "",
    };
  },
};
</script>

<style lang="less" scoped>
.manage-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  .inline-input {
    margin-right: 5px;
    margin-top: 2px;
  }
}
</style>