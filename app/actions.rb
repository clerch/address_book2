# Homepage (Root path)
helpers do 
  def full_name
    contact = Contact.find(params[:contact_id])
    @full_name = [contact.first_name, contact.last_name].join(" ")
  end
end

get '/' do 
  @contacts = Contact.all.order(first_name: :asc)
  erb :index
end

delete '/contact-delete/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy
end

post '/contact-add' do
  @new_contact = Contact.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
  )  
    if @new_contact.save!
      json  :contact => { new_contact:  @new_contact }
    end
end

post '/contact-update' do
  @contact = Contact.find_by(id: params[:contact_id])
  if @contact.update!(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone: params[:phone]
    )
    json  :contact => { contact:  @contact }
  end
end
