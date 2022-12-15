import 'package:coivd_19_app/services/contries_services.dart';
import 'package:coivd_19_app/widgets/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    CountriesAPi countriesAPi = CountriesAPi();
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: "Search with Country Name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        FutureBuilder(
          future: countriesAPi.fetchData(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CountriesList(
                    imageUrl: snapshot.data![index]['countryInfo']["flag"],
                    countyName: snapshot.data![index]['country'],
                    cases: snapshot.data![index]['cases'].toString(),
                  );
                },
              ));
            } else {
              return Center(
                child: Lottie.asset("assets/images/progessindicator.json",
                    height: MediaQuery.of(context).size.height * 0.3),
              );
            }
          },
        )
      ],
    );
  }
}
