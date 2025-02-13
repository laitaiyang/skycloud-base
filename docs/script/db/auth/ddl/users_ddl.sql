--  用户表
DROP TABLE IF EXISTS users;
CREATE TABLE users
(
  id                      BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户id',
  username                VARCHAR(100) NOT NULL COMMENT '用户名',
  password                VARCHAR(100) NOT NULL COMMENT '用户密码密文',
  name                    VARCHAR(200) COMMENT '用户姓名',
  mobile                  VARCHAR(20) COMMENT '用户手机',
  enabled                 bit COMMENT '是否有效用户',
  account_non_expired     bit COMMENT '账号是否未过期',
  credentials_non_expired bit COMMENT '密码是否未过期',
  account_non_locked      bit COMMENT '是否未锁定',
  create_time            DATETIME     NOT NULL DEFAULT now() COMMENT '创建时间',
  update_time            DATETIME     NOT NULL DEFAULT now() COMMENT '更新时间',
  create_by              VARCHAR(100) NOT NULL COMMENT '创建人',
  update_by              VARCHAR(100) NOT NULL COMMENT '更新人',
  disabled                int COMMENT '数据是否有效(0 有效 1 无效)'
) COMMENT '用户表';
CREATE UNIQUE INDEX ux_users_username
  ON users (username);
CREATE UNIQUE INDEX ux_users_mobile
  ON users (mobile);

--  角色表
DROP TABLE IF EXISTS roles;
CREATE TABLE roles
(
  id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '角色id',
  code         VARCHAR(100) NOT NULL COMMENT '角色code',
  name         VARCHAR(200) COMMENT '角色名称',
  description  VARCHAR(500) COMMENT '简介',
  create_time DATETIME     NOT NULL DEFAULT now() COMMENT '创建时间',
  update_time DATETIME     NOT NULL DEFAULT now() COMMENT '更新时间',
  create_by   VARCHAR(100) NOT NULL COMMENT '创建人',
  update_by   VARCHAR(100) NOT NULL COMMENT '更新人',
  disabled                int COMMENT '数据是否有效(0 有效 1 无效)'
) COMMENT '角色表';

-- 资源表
DROP TABLE IF EXISTS resources;
CREATE TABLE resources
(
  id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '资源id',
  code         VARCHAR(100) COMMENT '资源code',
  type         VARCHAR(100) COMMENT '资源类型',
  name         VARCHAR(200) COMMENT '资源名称',
  url          VARCHAR(200) COMMENT '资源url',
  method       VARCHAR(20) COMMENT '资源方法',
  description  VARCHAR(500) COMMENT '简介',
  create_time DATETIME     NOT NULL DEFAULT now() COMMENT '创建时间',
  update_time DATETIME     NOT NULL DEFAULT now() COMMENT '更新时间',
  create_by   VARCHAR(100) NOT NULL COMMENT '创建人',
  update_by   VARCHAR(100) NOT NULL COMMENT '更新人',
  disabled                int COMMENT '数据是否有效(0 有效 1 无效)'
) COMMENT '资源表';
CREATE UNIQUE INDEX ux_resources_code
  ON resources (code);

-- 用户和角色关系表
DROP TABLE IF EXISTS users_roles_relation;
CREATE TABLE users_roles_relation
(
  id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '关系id',
  user_id      INT          NOT NULL COMMENT '用户id',
  role_id      INT          NOT NULL COMMENT '角色id',
  create_time DATETIME     NOT NULL DEFAULT now() COMMENT '创建时间',
  update_time DATETIME     NOT NULL DEFAULT now() COMMENT '更新时间',
  create_by   VARCHAR(100) NOT NULL COMMENT '创建人',
  update_by   VARCHAR(100) NOT NULL COMMENT '更新人',
  disabled                int COMMENT '数据是否有效(0 有效 1 无效)'
) COMMENT '用户和角色关系表';

-- 角色和资源关系表
DROP TABLE IF EXISTS roles_resources_relation;
CREATE TABLE roles_resources_relation
(
  id           BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '关系id',
  resource_id  INT          NOT NULL COMMENT '角色id',
  role_id      INT          NOT NULL COMMENT '资源id',
  create_time DATETIME     NOT NULL DEFAULT now() COMMENT '创建时间',
  update_time DATETIME     NOT NULL DEFAULT now() COMMENT '更新时间',
  create_by   VARCHAR(100) NOT NULL COMMENT '创建人',
  update_by   VARCHAR(100) NOT NULL COMMENT '更新人',
  disabled                int COMMENT '数据是否有效(0 有效 1 无效)'
) COMMENT '角色和资源关系表';