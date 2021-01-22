defmodule Teacher.Airports.Airport do
  alias Teacher.Airports.Airport

  defstruct [:name, :city, :code, :country, :latitude, :longitude]

  def build(data) do
    %Airport{name: data["name"],
             city: data["city"],
             code: data["code"],
             country: data["country"],
             latitude: data["latitude"],
             longitude: data["longitude"]}
  end

end
