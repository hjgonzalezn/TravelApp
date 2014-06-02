# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140519220220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accions", force: true do |t|
    t.string   "acc_codigo"
    t.string   "acc_nombre"
    t.string   "acc_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actividads", force: true do |t|
    t.string   "actv_nombre"
    t.string   "actv_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogos", force: true do |t|
    t.string   "ctlg_categoria"
    t.string   "ctlg_subcategoria"
    t.string   "ctlg_valor_cdg"
    t.string   "ctlg_valor_desc"
    t.string   "ctlg_observacion"
    t.string   "ctlg_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "controls", force: true do |t|
    t.string   "ctrl_descripcion"
    t.string   "ctrl_html_id"
    t.string   "ctrl_tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dato_entidads", force: true do |t|
    t.string   "ent_dato_categoria"
    t.string   "ent_dato_codigo"
    t.string   "ent_dato_descripcion"
    t.text     "ent_dato_valor"
    t.string   "ent_dato_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ent_dato_subcategoria"
    t.string   "ent_dato_observacion"
  end

  create_table "division_territorial_pais", force: true do |t|
    t.integer  "entidad_territorial_id"
    t.integer  "division_territorial_id"
    t.integer  "dte_nivel"
    t.string   "dte_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "division_territorial_pais", ["division_territorial_id"], name: "index_division_territorial_pais_on_division_territorial_id", using: :btree
  add_index "division_territorial_pais", ["entidad_territorial_id"], name: "index_division_territorial_pais_on_entidad_territorial_id", using: :btree

  create_table "division_territorials", force: true do |t|
    t.string   "dvt_nombre"
    t.string   "dvt_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entidad_territorials", force: true do |t|
    t.string   "enter_nombre_oficial"
    t.text     "enter_presentacion"
    t.integer  "enter_padre"
    t.integer  "enter_nivel"
    t.string   "enter_estado_registro"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "division_territorial_id"
  end

  add_index "entidad_territorials", ["division_territorial_id"], name: "index_entidad_territorials_on_division_territorial_id", using: :btree
  add_index "entidad_territorials", ["region_id"], name: "index_entidad_territorials_on_region_id", using: :btree

  create_table "fotos", force: true do |t|
    t.string   "foto_nombre"
    t.string   "foto_titulo"
    t.string   "foto_descripcion"
    t.string   "foto_categoria"
    t.integer  "foto_llave_externa"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_mini"
  end

  create_table "funcion_controls", force: true do |t|
    t.integer  "funcionalidad_id"
    t.integer  "modelo_id"
    t.integer  "accion_id"
    t.integer  "control_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funcion_controls", ["accion_id"], name: "index_funcion_controls_on_accion_id", using: :btree
  add_index "funcion_controls", ["control_id"], name: "index_funcion_controls_on_control_id", using: :btree
  add_index "funcion_controls", ["funcionalidad_id"], name: "index_funcion_controls_on_funcionalidad_id", using: :btree
  add_index "funcion_controls", ["modelo_id"], name: "index_funcion_controls_on_modelo_id", using: :btree

  create_table "funcionalidads", force: true do |t|
    t.string   "func_descripcion"
    t.string   "func_publica"
    t.integer  "func_padre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.string   "mnu_tipo_elemento"
    t.string   "mnu_etiqueta_html"
    t.string   "mnu_clase_css"
    t.string   "mnu_props_html"
    t.text     "mnu_texto"
    t.integer  "mnu_padre"
    t.integer  "mnu_orden"
    t.integer  "modelo_id"
    t.integer  "accion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["accion_id"], name: "index_menus_on_accion_id", using: :btree
  add_index "menus", ["modelo_id"], name: "index_menus_on_modelo_id", using: :btree

  create_table "modelos", force: true do |t|
    t.string   "mdl_codigo"
    t.string   "mdl_nombre"
    t.string   "mdl_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paquete_turisticos", force: true do |t|
    t.string   "pqt_nombre"
    t.integer  "pqt_tipo_paquete"
    t.integer  "pqt_tipo_destino"
    t.text     "pqt_descripcion"
    t.text     "pqt_cobertura_servicios"
    t.text     "pqt_condiciones"
    t.text     "pqt_observacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parametro_sistemas", force: true do |t|
    t.string   "psis_categoria"
    t.string   "psis_codigo"
    t.string   "psis_valor"
    t.string   "psis_descripcion"
    t.string   "psis_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfils", force: true do |t|
    t.string   "prf_nombre"
    t.string   "prf_descripcion"
    t.string   "prf_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prf_tipo_perfil"
  end

  create_table "permisos", force: true do |t|
    t.integer  "perfil_id"
    t.integer  "funcionalidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permisos", ["funcionalidad_id"], name: "index_permisos_on_funcionalidad_id", using: :btree
  add_index "permisos", ["perfil_id"], name: "index_permisos_on_perfil_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "reg_nombre"
    t.text     "reg_descripcion"
    t.string   "reg_estado_registro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entidad_territorial_id"
  end

  add_index "regions", ["entidad_territorial_id"], name: "index_regions_on_entidad_territorial_id", using: :btree

  create_table "usuarios", force: true do |t|
    t.string   "usr_tipo_docum_ident"
    t.integer  "usr_nro_docum_ident"
    t.string   "usr_nombres"
    t.string   "usr_apellidos"
    t.string   "usr_correo_electronico"
    t.string   "usr_contrasena"
    t.string   "usr_tipo_contrasena"
    t.date     "usr_fecha_nacimiento"
    t.string   "usr_genero"
    t.binary   "usr_foto"
    t.datetime "usr_fch_ultimo_ingreso"
    t.string   "usr_tipo_cliente"
    t.datetime "usr_fecha_ultima_salida"
    t.date     "usr_fch_vigencia_contrasena"
    t.string   "usr_estado"
    t.integer  "perfil_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "usr_salt"
  end

  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree
  add_index "usuarios", ["usr_apellidos"], name: "index_usuarios_on_usr_apellidos", using: :btree
  add_index "usuarios", ["usr_correo_electronico"], name: "index_usuarios_on_usr_correo_electronico", unique: true, using: :btree
  add_index "usuarios", ["usr_nombres"], name: "index_usuarios_on_usr_nombres", using: :btree
  add_index "usuarios", ["usr_nro_docum_ident"], name: "index_usuarios_on_usr_nro_docum_ident", unique: true, using: :btree

end
