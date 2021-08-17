require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'last_nameが全角であれば登録できる' do
        @user.last_name = '名前'
        expect(@user).to be_valid
      end
      it 'first_nameが全角であれば登録できる' do
        @user.first_name = '名前'
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角であれば登録できる' do
        @user.last_name_kana = 'ナマエ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角であれば登録できる' do
        @user.first_name_kana = 'ナマエ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '同じemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは半角の英字と数字を使用してください', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordは半角英数字混合でないと登録できない(数字のみ)' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは半角の英字と数字を使用してください')
      end
      it 'passwordは半角英数字混合でないと登録できない(英字のみ)' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは半角の英字と数字を使用してください')
      end
      it 'passwordは半角でないと登録できない' do
        @user.password = 'ABc１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは半角の英字と数字を使用してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'ABc123'
        @user.password_confirmation = 'efg456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください', '姓は全角文字で入力してください')
      end
      it 'last_nameが全角(漢字・ひらがな・カタカナ)でないと登録できない' do
        @user.last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は全角文字で入力してください')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください', '名は全角文字で入力してください')
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は全角文字で入力してください')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓カナを入力してください', '姓カナは全角カタカナで入力してください')
      end
      it 'last_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.last_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓カナは全角カタカナで入力してください')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名カナを入力してください', '名カナは全角カタカナで入力してください')
      end
      it 'first_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.first_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名カナは全角カタカナで入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
    end
  end
end
