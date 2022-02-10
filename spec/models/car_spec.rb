RSpec.describe Car, type: :model do
  let(:car) { FactoryBot.create(:car) }

  context 'validation have db column' do
    it { is_expected.to have_db_column(:make).of_type(:string) }
    it { is_expected.to have_db_column(:model).of_type(:string) }
    it { is_expected.to have_db_column(:year).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:integer) }
    it { is_expected.to have_db_column(:odometer).of_type(:integer) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'validation presence' do
    it { is_expected.to validate_presence_of(:make) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:odometer) }
    it { is_expected.to validate_presence_of(:description) }
  end

  context 'validation values' do
    it 'validates make length' do
      is_expected.to validate_length_of(:make).is_at_least(2).is_at_most(50)
    end

    it 'validates model length' do
      is_expected.to validate_length_of(:model).is_at_least(2).is_at_most(50)
    end

    it 'validates year range 1900 - current year' do
      is_expected.to validate_numericality_of(:year)
        .is_greater_than_or_equal_to(1900).is_less_than_or_equal_to(Date.current.year)
    end

    it 'price greater than 0' do
      is_expected.to validate_numericality_of(:price)
        .is_greater_than(0)
    end

    it 'odometer greater than 0' do
      is_expected.to validate_numericality_of(:odometer)
        .is_greater_than(0)
    end
  end

  context 'validation types' do
    it 'validate year integer' do
      is_expected.to validate_numericality_of(:year).only_integer
    end

    it 'validate price integer' do
      is_expected.to validate_numericality_of(:price).only_integer
    end

    it 'validate odometer integer' do
      is_expected.to validate_numericality_of(:odometer).only_integer
    end

    it 'validate price greater than 0' do
      is_expected.to validate_length_of(:description).is_at_most(500)
    end
  end

  context 'create' do
    it 'valid car' do
      expect(car).to be_valid
    end
  end
end
