<template slot-scope="scope">
  <div>
    <el-table :data="userData" border style="width: auto">
      <el-table-column
        fixed="left"
        prop="id"
        label="ID"
        width="180"
      ></el-table-column>
      <el-table-column
        v-for="(item, index) in tableLabel"
        :key="item.prop"
        :prop="item.prop"
        :label="item.label"
        :width="item.width ? item.width : 180"
      >
      </el-table-column>

      <el-table-column label="操作" fixed="right" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="primary"
            icon="el-icon-edit"
            @click="handleEdit(scope.$index, scope.row)"
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
            @click="handleDelete(scope.$index, scope.row)"
          ></el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
    <el-tag type="success" class="tag">共有 {{pageNum}} 条数据</el-tag>
    <el-pagination
      background
      layout="prev, pager, next"
      :total="total"
      :page-size="8"
      @current-change="handleCurrentChange"
    >
    </el-pagination>
    </div>
  </div>
</template>

<script>
import { getUserData } from "network/user";
export default {
  name: "ContentForm",
  props: {
    userData: {
      type: Array,
      default() {
        return [];
      },
    },
    tableLabel: {
      type: Array,
      default() {
        return [];
      },
    },
  },
  data() {
    return {
      total: 0,
      pageNum: 1,
    };
  },
  methods: {
    handleClick(row) {
      // console.log(row);
    },
    handleEdit(index, row) {
      this.$emit("edit", index, row);
    },
    handleDelete(index, row) {
      this.$emit("del", index, row);
    },
    handleCurrentChange(page) {
      this.$emit('page',page);
    },
  },
  mounted() {
    getUserData().then(res => {
      this.total = res.totalCount
      this.pageNum = res.totalCount
    })
  },
};
</script>

<style lang="less" scoped>
.pagination {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
</style>