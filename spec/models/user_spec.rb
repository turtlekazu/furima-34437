require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '成功する場合' do
      it 'ニックネーム、メール、パスワード、確認用パスワード、名前、名前カナ、誕生日全て揃っていて登録成功' do
        expect(@user).to be_valid
      end
    end

    context '失敗する場合' do
      it 'ニックネームが空で登録失敗' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールが空で登録失敗' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールに@がなくて登録失敗' do
        @user.email = 'hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'メールが重複して登録失敗' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが空で登録失敗' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが英語しか入っていなくて登録失敗' do
        @user.password = 'hogefuga'
        @user.password_confirmation = 'hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワードが数字しか入っていなくて登録失敗' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワードと確認用パスワードが一致しなくで登録失敗' do
        @user.password = 'hogefuga123'
        @user.password_confirmation = '123hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードが5文字以下で登録失敗' do
        @user.password = 'fo123'
        @user.password_confirmation = 'fo123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '名前(姓)が空で登録失敗' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前(名)が空で登録失敗' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前(姓)が全角でないため登録失敗' do
        @user.last_name = 'hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it '名前(名)が全角でないため登録失敗' do
        @user.first_name = 'hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it '名前カナ(姓)が空のため登録失敗' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '名前カナ(名)が空のため登録失敗' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '名前カナ(姓)がカタカナでないため登録失敗' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it '名前カナ(名)がカタカナでないため登録失敗' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it '誕生日が空のため登録失敗' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
