shared_examples "paginated list" do
  it { expect(json_response).to have_key(:meta) }
  it { expect(json_response[:meta]).to have_key(:pagination) }
  it { expect(json_response[:meta][:pagination]).to have_key(:current_page) }
  it { expect(json_response[:meta][:pagination]).to have_key(:next_page) }
  it { expect(json_response[:meta][:pagination]).to have_key(:prev_page) }
  it { expect(json_response[:meta][:pagination]).to have_key(:total_pages) }
  it { expect(json_response[:meta][:pagination]).to have_key(:total_count) }
end