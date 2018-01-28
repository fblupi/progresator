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

ActiveRecord::Schema.define(version: 20180128105459) do

  create_table "exercise_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_images_on_exercise_id"
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title_en"
    t.string "title_es"
    t.text "instructions_en"
    t.text "instructions_es"
    t.boolean "has_resting_time"
    t.boolean "has_time"
    t.boolean "has_repetitions"
    t.boolean "has_weight"
    t.boolean "has_speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercises_muscles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_id"
    t.bigint "muscle_id"
    t.integer "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercises_muscles_on_exercise_id"
    t.index ["muscle_id"], name: "index_exercises_muscles_on_muscle_id"
  end

  create_table "exercises_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercises_sessions_on_exercise_id"
    t.index ["session_id"], name: "index_exercises_sessions_on_session_id"
  end

  create_table "exercises_training_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_id"
    t.bigint "training_day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercises_training_days_on_exercise_id"
    t.index ["training_day_id"], name: "index_exercises_training_days_on_training_day_id"
  end

  create_table "muscles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_en"
    t.string "name_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progressions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resting_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal "resting_time", precision: 5, scale: 2
    t.integer "goal_time"
    t.integer "goal_repetitions"
    t.decimal "goal_weight", precision: 5, scale: 2
    t.decimal "goal_speed", precision: 5, scale: 2
    t.integer "time"
    t.integer "repetitions"
    t.decimal "weight", precision: 5, scale: 2
    t.decimal "speed", precision: 5, scale: 2
    t.bigint "exercises_training_day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercises_training_day_id"], name: "index_resting_times_on_exercises_training_day_id"
  end

  create_table "routines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_en"
    t.string "name_es"
    t.text "description_en"
    t.text "description_es"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "routines_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "routine_id"
    t.bigint "user_id"
    t.bigint "progression_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progression_id"], name: "index_routines_users_on_progression_id"
    t.index ["routine_id"], name: "index_routines_users_on_routine_id"
    t.index ["user_id"], name: "index_routines_users_on_user_id"
  end

  create_table "sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name_en"
    t.string "name_es"
    t.text "description_en"
    t.text "description_es"
    t.bigint "routine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_sessions_on_routine_id"
  end

  create_table "training_days", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "day"
    t.bigint "progression_id"
    t.bigint "routines_user_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["progression_id"], name: "index_training_days_on_progression_id"
    t.index ["routines_user_id"], name: "index_training_days_on_routines_user_id"
    t.index ["session_id"], name: "index_training_days_on_session_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
