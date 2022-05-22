<template>
  <div id="user">
    <user-add-search></user-add-search>
    <el-card style="width: auto; margin-top: 30px">
      <common-table></common-table>
    </el-card>
  </div>
</template>

<script>
import CommonTable from "components/common/commonTable/CommonTable.vue";
import CommonForm from "components/common/commonTable/CommomForm.vue";
import UserAddSearch from "./userComps/UserAddSearch.vue";

export default {
  name: "User",
  components: {
    CommonTable,
    CommonForm,
    UserAddSearch,
  },
  data() {
    return {};
  },
  mounted() {},
};
</script>

<style lang="less" scoped>

</style>