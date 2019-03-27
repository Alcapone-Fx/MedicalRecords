package com.example.medicalrecords;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class CreaExpedienteActivity extends AppCompatActivity {

    ImageButton buttonBack;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crea_expediente);

        // instanciando el tipo Button a partir del button creado en el archivo XML
        //se realiza la busqueda por id en archivo R donde se encuentran todos los elementos de la app
        buttonBack = (ImageButton) findViewById(R.id.imageButtonBack);

        //setea una escucha (listener) al hacer click, pasa como parametro la interfaz y la implementa
        buttonBack.setOnClickListener(new View.OnClickListener() {
            @Override//sobre escritura del metodo
            public void onClick(View v) {//las acciones al realizar el click
                Intent intentBack = new Intent(CreaExpedienteActivity.this, ExpedientesActivity.class);
                startActivity(intentBack);

            }
        });
    }


}
