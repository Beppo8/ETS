defmodule TeacherAirports.Loader do
  alias Teacher.Airports.Airport

  @file_path Path.join([__DIR__, "../../../priv", "airports.csv"])

  def load do
    :ets.new(:airports, [:named_table])

    @file_path
    |> File.stream!()
    |> CSV.decode!(headers: true)
    |> Stream.map(&Airport.build/1)
    |> Stream.map(&(store_in_ets(&1)))
    |> Stream.run()
  end

  defp store_in_ets(airport) do
    :ets.insert_new(:airports, {String.downcase(airport.code), airport})
  end

end
