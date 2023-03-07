<template>
  <a-layout>
    <a-layout-header class="header">
      <div class="logo" />
      <a-menu
        v-model:selectedKeys="booksKeys"
        theme="dark"
        mode="horizontal"
        :style="{ lineHeight: '64px' }"
      >
        <a-menu-item :key="name.id" v-for="name in booksName">{{ name.ch }}</a-menu-item>
      </a-menu>
    </a-layout-header>
    <a-layout>
      <a-layout-sider width="200" style="background: #fff">
        <a-menu
          v-model:selectedKeys="catalogKeys"
          mode="inline"
          :style="{ height: '100%', borderRight: 0 }"
        >
          <a-menu-item :key="catalog.id" v-for="catalog in selectedBook?.catalog">{{ catalog.title }}</a-menu-item>
        </a-menu>
      </a-layout-sider>
      <a-layout style="padding: 0 24px 24px">
        <a-breadcrumb style="margin: 16px 0">
          <a-breadcrumb-item>{{ selectedBook?.['ch-name'] }}</a-breadcrumb-item>
          <a-breadcrumb-item>{{ selectedBook?.catalog.find(catalog => catalog.id === catalogKeys[0])?.title }}</a-breadcrumb-item>
          <a-breadcrumb-item>演示</a-breadcrumb-item>
        </a-breadcrumb>
        <a-layout-content
          :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }"
        >
          <component :is="currentComponent"></component>
        </a-layout-content>
      </a-layout>
    </a-layout>
  </a-layout>
</template>
<script lang="ts">
import { UserOutlined, LaptopOutlined, NotificationOutlined } from '@ant-design/icons-vue';
import { computed, defineAsyncComponent, defineComponent, reactive, ref, shallowRef, watch, watchEffect } from 'vue';
import axios from 'axios'
export default defineComponent({
  components: {
    UserOutlined,
    LaptopOutlined,
    NotificationOutlined,
  },
  setup() {
    type book = {
      id: string,
      "ch-name": string,
      "en-name": string,
      catalog: {id: string, title: string}[] 
    }
    const books = ref<book[]>([])
    const booksName = computed(() => books.value.map(book => ({id: book.id, ch: book['ch-name'], en: book['en-name']})))
    // 选中的书籍，默认是第一本书
    const booksKeys = ref([''])
    watchEffect(() => {
      booksKeys.value =  [booksName.value[0]?.id]
    })
    const selectedBook = computed(() => {
      const selectedKey = booksKeys.value[0]
      return books.value.find(book => book.id === selectedKey)
    })
    // 选中的章节，默认是第一章
    // 默认目录已经排列好了
    const catalogKeys = ref([''])
    watchEffect(() => {
      catalogKeys.value = [selectedBook?.value?.catalog[0].id ?? '0']
    })

    const currentComponent = shallowRef(null)
    watchEffect(() => {
      if (booksKeys.value[0] && catalogKeys.value[0]) {
        try {
          currentComponent.value = defineAsyncComponent(() => import(`./books/${booksKeys.value[0]}/${catalogKeys.value[0]}/index.vue`))
        } catch (e) {
          console.error("引入组件异常")
        }
      }
    })
    axios
    .get('http://127.0.0.1:4523/m1/2321362-0-default/api/v1/books')
    .then(({data}) => {
      books.value = data.data
    })
    return {
      booksName,
      booksKeys,
      selectedBook,
      catalogKeys,
      currentComponent
    };
  },
});
</script>
<style>
#components-layout-demo-top-side-2 .logo {
  float: left;
  width: 120px;
  height: 31px;
  margin: 16px 24px 16px 0;
  background: rgba(255, 255, 255, 0.3);
}

.ant-row-rtl #components-layout-demo-top-side-2 .logo {
  float: right;
  margin: 16px 0 16px 24px;
}

.site-layout-background {
  background: #fff;
}
</style>
