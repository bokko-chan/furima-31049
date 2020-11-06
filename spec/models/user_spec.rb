require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録を失敗するとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "12345a"
        @user.password_confirmation = "11111a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が無ければ登録できない" do
        @user.email = "aaa.bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordは半角英数混合でなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "family_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "first_name_kanaは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "はなこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end

    context '新規登録が成功するとき' do
      it "新規登録のフォームが入力されていれば登録できる" do
        @user.valid?
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが一致すれば登録できる" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "emailに@が含まれていれば登録できる" do
        @user.email = "aaa@aaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数混合であれば登録できる" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
      it "family_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "山田やまだヤマダ"
        expect(@user).to be_valid
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "花子はなこハナコ"
        expect(@user).to be_valid
      end
      it "family_name_kanaは全角（カタカナ）であれば登録できる" do
        @user.family_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      it "first_name_kanaは全角（カタカナ）であれば登録できる" do
        @user.first_name_kana = "ハナコ"
        expect(@user).to be_valid
      end
    end
    
  end
end
