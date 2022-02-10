RSpec.describe Search, type: :model do
  let(:search) { FactoryBot.create(:search) }

  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validation' do
    it { is_expected.to have_db_column(:make).of_type(:string) }
    it { is_expected.to have_db_column(:model).of_type(:string) }
    it { is_expected.to have_db_column(:year_from).of_type(:integer) }
    it { is_expected.to have_db_column(:year_to).of_type(:integer) }
    it { is_expected.to have_db_column(:price_from).of_type(:integer) }
    it { is_expected.to have_db_column(:price_to).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'create' do
    it 'valid search' do
      expect(search).to be_valid
    end
  end
end
