<template>
  <div>
    <el-table :data="userData" border style="width: 100%">
      <el-table-column
        v-for="(item, index) in tableLabel"
        :key="item.prop"
        :prop="item.prop"
        :label="item.label"
        :width="item.width ? item.width : 125" 
      >
      </el-table-column>

      <el-table-column fixed="right" label="操作" width="180">
        <el-row>
          <el-button-group>
            <el-button
              size="mini"
              type="primary"
              icon="el-icon-edit"
            ></el-button>
            <el-button
              size="mini"
              type="success"
              icon="el-icon-share"
            ></el-button>
            <el-button
              size="mini"
              type="danger"
              icon="el-icon-delete"
            ></el-button>
          </el-button-group>
        </el-row>
      </el-table-column>
    </el-table>
    <el-pagination
      class="pagination"
      background
      layout="prev, pager, next"
      :total="100"
    >
    </el-pagination>
  </div>
</template>

<script>
import { getUserData } from "network/user";

export default {
  name: "ContentForm",
  data() {
    return {
      userData: [],
      tableLabel: [
        {
          prop: "id",
          label: "ID",
          width: 100,
        },
        {
          prop: "user_name",
          label: "用户名称",
        },
        {
          prop: "user_password",
          label: "用户密码",
        },
        {
          prop: "user_time",
          label: "注册时间",
          width: 200,
        },
        {
          prop: "user_permissions",
          label: "用户权限",
          width: 125,
        },
        {
          prop: "memo",
          label: "备注",
          width: 125,
        },
        {
          prop: "state",
          label: "账号状态",
          width: 125,
        },
      ],
    };
  },
  methods: {
    handleClick(row) {
      console.log(row);
    },
  },
  mounted() {
    getUserData().then((res) => {
      this.userData = res.data.tb_userlist;
      console.log(res);
    });
  },
};
</script>

<style lang="less" scoped>
.pagination {
  margin-top: 20px;
  text-align: right;
}
</style>