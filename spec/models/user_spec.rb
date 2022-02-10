RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'associations' do
    it { is_expected.to have_many(:searches).dependent(:delete_all) }
  end

  context 'validation' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context 'create' do
    it 'valid user' do
      expect(user).to be_valid
    end
  end
end
