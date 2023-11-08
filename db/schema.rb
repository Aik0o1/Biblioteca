# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_05_234224) do
  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresta", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "livro_id", null: false
    t.date "data_emprestimo"
    t.date "data_devolucao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_empresta_on_aluno_id"
    t.index ["livro_id"], name: "index_empresta_on_livro_id"
  end

  create_table "empresta_livros", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "livro_id", null: false
    t.date "data_emprestimo"
    t.date "data_devolucao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_empresta_livros_on_aluno_id"
    t.index ["livro_id"], name: "index_empresta_livros_on_livro_id"
  end

  create_table "emprestimos", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.integer "livro_id", null: false
    t.date "data_emprestimo"
    t.date "data_devolucao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_emprestimos_on_aluno_id"
    t.index ["livro_id"], name: "index_emprestimos_on_livro_id"
  end

  create_table "livros", force: :cascade do |t|
    t.string "titulo"
    t.string "autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "empresta", "alunos"
  add_foreign_key "empresta", "livros"
  add_foreign_key "empresta_livros", "alunos"
  add_foreign_key "empresta_livros", "livros"
  add_foreign_key "emprestimos", "alunos"
  add_foreign_key "emprestimos", "livros"
end
