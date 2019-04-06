public class ParkLocator {
    public static List<String> country(String country){
        ParkService.ParksImplPort prkService = new ParkService.ParksImplPort();
        return prkService.byCountry(country);
    }
}