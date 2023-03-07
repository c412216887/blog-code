/*
 * @LastEditors: chenlu chenlu0917boy@163.com
 * @Date: 2023-02-18 13:30:09
 * @LastEditTime: 2023-02-18 13:43:46
 * @FilePath: \blog-code\vite.config.ts
 */
import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";

import Components from "unplugin-vue-components/vite";
import { AntDesignVueResolver } from "unplugin-vue-components/resolvers";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    Components({
      resolvers: [AntDesignVueResolver()],
    }),
  ],
});
