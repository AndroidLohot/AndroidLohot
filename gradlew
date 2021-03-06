package com.example.a;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;

import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class UpdateActivity extends AppCompatActivity {

    private DatabaseReference myRef;
    private FirebaseDatabase myDb;
    private String Name;

    private float drBile;
    private float kiBile;
    private float paBile;

    private EditText upName,upDrBile,upKirana,upPatrol;
    private DeliNote deliNote;

    private String key;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update);

        myDb=FirebaseDatabase.getInstance();
        myRef=myDb.getReference("User");

        upDrBile=(EditText)findViewById(R.id.upDrBile);
        upName=(EditText)findViewById(R.id.upName);
        upKirana=(EditText)findViewById(R.id.upKiranabile);
        upPatrol=(EditText)findViewById(R.id.upPatrolBile);

        Bundle bundle=getIntent().getExtras();

        key=bundle.getString("upNote");
        deliNote=new DeliNote();

        deliNote.setNoteID(key);

        Name=deliNote.getName();
        drBile=deliNote.getDrBile();
        kiBile=deliNote.getKiBile();
        paBile=deliNote.getPaBile();

        upName.setText(Name);
        upPatrol.setText(String.valueOf(paBile));
        upKirana.setText(String.valueOf(kiBile));
        upDrBile.setText(String.valueOf(drBile));



    }

    public void updateF(View view) {




        String Name=upName.getText().toString();
        if (TextUtils.isEmpty(Name))
        {
            upName.setError("Enter this fild");
            return;
        }

        String drBile=upDrBile.getText().toString();
        if (TextUtils.isEmpty(drBile))
        {
            upDrBile.setError("Enter this fild");
            return;
        }

        String kiBile=upKirana.getText().toString();
        if (TextUtils.isEmpty(kiBile))
        {
            upKirana.setError("Enter this fild");
            return;
        }

        String paBile=upPatrol.getText().toString();
        if (TextUtils.isEmpty(paBile))
        {
            upPatrol.setError("Enter this fild");
            return;
        }

        float db=Float.valueOf(drBile);
        float kb=Float.valueOf(kiBile);
        float pb=Float.valueOf(paBile);

        DeliNote deliNote=new DeliNote(db,kb,pb,Name);

        myRef.child(key).child("name").setValue(Name);
        myRef.child(key).child("drBile").setValue(db);
        myRef.child(key).child("paBile").setValue(pb);
        myRef.child(key).child("kiBile").setValue(kb);

        Intent intent=new Intent(UpdateActivity.this,MainActivity.class);
        startActivity(intent);
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     