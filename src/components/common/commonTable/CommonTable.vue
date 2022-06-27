<template slot-scope="scope">
  <div>
    <el-table
      v-loading="loading"
      element-loading-text="拼命加载中"
      element-loading-spinner="el-icon-loading"
      element-loading-background="rgba(0, 0, 0, 0.8)"
      :data="userData"
      border
      style="width: auto"
    >
      <el-table-column
        fixed="left"
        prop="id"
        label="ID"
        width="180"
      ></el-table-column>
      <el-table-column prop="image" label="头像(查看大图)" width="150">
        <template slot-scope="scope">
          <el-image
            v-if="scope.row.image"
            :src="baseUrl() + scope.row.image"
            :preview-src-list="[baseUrl() + scope.row.image]"
            style="width: 70px; height: 70px"
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column
        v-for="(item, index) in tableLabel"
        :key="index"
        :prop="item.prop"
        :label="item.label"
        :width="item.width ? item.width : 180"
      >
      </el-table-column>
      <el-table-column prop="state" label="账号状态" width="140">
        <template slot-scope="scope">
          <div slot="reference" class="name-wrapper">
            <el-tag
              v-if="scope.row.state == '正常'"
              type="success"
              size="medium"
              >{{ scope.row.state }}</el-tag
            >
            <el-tag v-else type="danger" size="medium">{{
              scope.row.state
            }}</el-tag>
          </div>
        </template>
      </el-table-column>

      <el-table-column label="操作" fixed="right" width="180">
        <template slot-scope="scope">
          <div v-if="permissions == '管理员'">
            <el-button
            closable
            type="success"
            icon="el-icon-view"
            @click="handleView(scope.$index, scope.row)"
          >查看</el-button>
          </div>
          <div v-else>
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
          </div>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-tag type="success" class="tag">共有 {{ pageNum }} 条数据</el-tag>
      <el-pagination
        background
        layout="prev, pager, next"
        :total="total"
        :page-size="5"
        @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>
  </div>
</template>

<script>
import { getUserData } from "network/user";
import { baseUrl } from "network/request";
import Cookie from 'js-cookie';
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
    loading:{
      type:Boolean,
    }
  },
  data() {
    return {
      total: 0,
      pageNum: 0,
    };
  },
  computed:{
    permissions() {
      return this.$store.state.user.permissions || Cookie.get('permissions')
    }
  },
  methods: {
    baseUrl() {
      return baseUrl();
    },
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
      this.$emit("page", page);
    },
    handleView(index,row){
      this.$emit("view", index, row);
    }
  },
  mounted() {
    getUserData().then((res) => {
      this.total = res.totalCount;
      this.pageNum = res.totalCount;
    });
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