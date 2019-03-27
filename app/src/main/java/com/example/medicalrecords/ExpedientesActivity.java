package com.example.medicalrecords;

import android.app.Application;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

public class ExpedientesActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_expedientes);

        ImageButton creaExpImageButton = findViewById(R.id.imageButtonCreaExpediente);
        ImageButton salirImageButton = findViewById(R.id.imageButtonSalir);

        //evento al dar click en el boton agregar expediente
        creaExpImageButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent creaExpIntent = new Intent(ExpedientesActivity.this, CreaExpedienteActivity.class);
                startActivity(creaExpIntent);
            }
        });

        //evento al dar click en el salir
        salirImageButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                Intent intent = new Intent(Intent.ACTION_MAIN);
                intent.addCategory(Intent.CATEGORY_HOME);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });

    }
}
